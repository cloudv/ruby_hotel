require '../src/some_script'
require 'Timecop'

describe  SomeScript do
  it 'should be ' do
    Timecop.scale(5000) do
      ss = SomeScript.new
      ss.retryfn
    end
  end



end