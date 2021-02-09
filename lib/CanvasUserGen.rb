require 'faker'
require 'User.rb'
class CanvasUserGen
  @name_format
  @sis_id_format
  @email_domain

  def initialize(emailDomain)
    @emailDomain = emailDomain
  end

  def set_name_format(modifiers = {prefix: "", postfix: ""})
    div = "|"
    modifiers[:prefix] += div if modifiers[:prefix] != ""
    modifiers[:postfix] = div+modifiers[:postfix] if modifiers[:postfix] != ""
    @name_format = "#{modifiers[:prefix] }NAME#{modifiers[:postfix]}"
  end

  def set_sis_format(modifiers = {prefix: "", postfix: ""})
      div = "|"
      modifiers[:prefix] += div if modifiers[:prefix] != ""
      modifiers[:postfix] = div+modifiers[:postfix] if modifiers[:postfix] != ""
      @sis_id_format = "#{modifiers[:prefix] }NAME#{modifiers[:postfix]}"
  end

  def gen_user
    usr = User.new
    usr.set_name(gen_name)
    usr.set_sis(gen_sis)
    usr.set_email(@email_domain)

    return usr
  end

  private

  def gen_name
    @name_format = "NAME" if @name_format.nil?
    names = @name_format.split("|")
    n = ""
    names.each do |name|
      temp = name
      temp = getTokenReplacement(name)
      n += temp
    end
    return n
  end

  def gen_sis
    @sis_id_format = "ALPHN20" if @sis_id_format.nil?
    siss = @sis_id_format.split("|")
    s = ""
    siss.each do |sis|
      temp = sis
      temp = getTokenReplacement(sis)
      s += temp
    end
    return s
  end

  def getTokenReplacement(token)
    if(token == "NAME")
      return Faker::Name.name
    end
    if (token[0..2] == "NUM")
      return Faker::Number.number(token[3..15].to_i)
    end
    if (token[0..4] == "ALPHA")
      return Faker::Alphanumeric.alpha(token[5..15].to_i)
    end
    if (token[0..4] == "ALPHN")
      return Faker::Alphanumeric.alphanumeric(token[5..15].to_i)
    end
    return token
  end
end
