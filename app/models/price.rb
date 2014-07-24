class Price < ActiveRecord::Base
  mount_uploader :file, PriceUploader
  has_many :products, dependent: :destroy
  validates_presence_of :file
  after_commit :process, if: ->(p){p.previous_changes.include? :file}

  state_machine :state, initial: :created do
    event(:processing_started) {transition :created => :processing}
    event(:processing_finished) {transition :processing => :processed}
    event(:processing_failed) {transition any => :failed}
  end

  def name
    Pathname.new(file.path).basename
  end

  def process
    XLSParser.perform_async(id)
  end
end
