require '../src/some_script'

describe  SomeScript do
  before do
    @someInstance = SomeScript.new
  end

  it 'should call funb' do
    @someInstance.should_receive(:funb).once.with(["a","b"]).and_return("a,b")
    @someInstance.funa(["a","b"])
  end

end