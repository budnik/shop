class XLSParser
  include Sidekiq::Worker
  sidekiq_options :retry => 1
  
  def perform(price_id)
    p = Price.find(price_id)
    p.processing_started

    #fixess non ascii filename
    extension = File.extname p.file.path
 
    xls = Roo::Spreadsheet.open p.file.path, extension: extension

    header, *data = xls.parse(mapping)
    products = Product.where(price_id: price_id).create(data)

    if products.any? &:persisted?
      p.processing_finished
    else
      p.processing_failed
    end
  rescue StandardError => e
    p.try :processing_failed
  end

  private

  def mapping
    {
      code:         "Код производителя",
      model_name:   "Модель",
      vendor:       "Производитель",
      category:     "Группа",
      subcategory:  "Подгруппа",
      name:         "Наименование",
      retail_price: "Розница",
      wholesale:    "Опт",
      dealer_price: "Дил",
      partner_price:"Парт",
      stock:        "Склад*", #"Склад1-2", "Склад 3-7",
      warranty:     "Гар."
    }
  end
end
