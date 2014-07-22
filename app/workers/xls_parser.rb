class XLSParser
  def perform(price_id)
    if p = Price.find(price_id)
        xls = Roo::Spreadsheet.open p.file.path
        data = xls.parse(mapping)
      binding.pry
    end
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