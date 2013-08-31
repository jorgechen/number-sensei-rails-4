class BinaryExpression < Expression
  self.abstract_class = true

  attr_accessor :left, :right
  def left
    @left = children.first unless @left
    @left
  end
  def right
    @right = children.last unless @right
    @right
  end


  def self.build left, right
    x = self.new
    x.left = left
    x.right = right
    x
  end

  # @abstract
  def token_plain_text
  end

  # @abstract
  def token_html
  end

  # @override
  def plain_text
    children.map {|x| x.plain_text }.compact.join("#{DELIMITER_PLAIN_TEXT}#{self.token_plain_text}#{DELIMITER_PLAIN_TEXT}")
  end

  # @override
  def html
    children.map {|x| x.html }.compact.join("#{DELIMITER_HTML}#{self.token_html}#{DELIMITER_HTML}")
  end

  # @override
  def evaluate
  end


  validate :validate_children

  after_validation :save_kids

  protected

  def validate_children
    errors.add(:children, 'left & right should be expressions') unless left.is_a? Expression and right.is_a? Expression
  end

  def save_kids
    add_child left
    add_child right
  end

  # @override
  def save_token
    self.token = token_plain_text
  end

end
