describe Chirper::UseCase::CreateChirp do
  it 'Call Gateway create Chirp' do
    gateway_spy = spy
    use_case = described_class.new(chirp_gateway: gateway_spy)
    use_case.execute(title: 'Meow', body: 'Cat')

    expect(gateway_spy).to have_received(:create)
  end

  it 'Call Gateway create Chirp with the correct information' do
    gateway_spy = spy
    use_case = described_class.new(chirp_gateway: gateway_spy)
    use_case.execute(title: 'Meow', body: 'Cat')

    expect(gateway_spy).to have_received(:create) do |chirp|
      expect(chirp.title).to eq('Meow')
      expect(chirp.body).to eq('Cat')
    end
  end
end