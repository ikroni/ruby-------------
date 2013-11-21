class Chanel
  def initialize
    @sym = true
  end

  def start_transact
    #puts "sym #{@sym}"
    if @sym
      @sym = false
      @ret = true
    else
      @ret = false
    end
    #puts "sym #{@sym} ret #{@ret}"
    @ret
  end

  def end_transact
    if not @sym
      @sym = true
      @ret = true
    else
      @ret = false
    end
    @ret
  end

end