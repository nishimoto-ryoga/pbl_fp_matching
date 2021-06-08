class CharsMustBeLessThan4bytesValidator < ActiveModel::EachValidator
  # UTF-8で4バイト以上の文字かを判定する
  def validate_each(record, attribute, value)
    return if value.nil?

    unavailable_chars = value.scan(/[^\u0000-\uD7FF\uE000-\uFFFF]/)

    record.errors.add(attribute, message: '使用できない文字が含まれています') if unavailable_chars.present?
  end
end
