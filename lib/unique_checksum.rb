module UniqueChecksum
  DELIMITER = '-'

  # @return [String] checksum generated from the inputs
  def self.from_array(list, delimiter = DELIMITER)
    # The checksum is separated by dashes:
    # 8 - a3 - 2 - de - zg - fj - eia - thai - 9j3
    # 8 indicates the count of items in the list
    # a3, 2, de ... are the IDs of questions converted to base 62
    "#{list.count.to_s}#{delimiter}#{list.map { |x| x.id.b(62).to_s(Radix::BASE::B62) }.join(delimiter)}"
  end
end