class SomeScript
  def raiseErrorfn
    p 'raise error'
    raise_error("anError")
  end

  def retryfn
    limit = 0
    begin
      sleep(5000)
      raiseErrorfn
    rescue
      limit += 1
      if limit <= 5
        p "retry #{limit}"
        retry
      end
    end
  end

  def funa config
    config = funb config
    x = "config :" + config
  end

  def funb config
    x = config.to_s
  end
end