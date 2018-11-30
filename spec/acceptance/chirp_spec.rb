xdescribe 'Using Chirper' do
  it 'Allows us to create a chirp and view it' do
    chirp_gateway = Chirper::Gateway::InMemoryChirp.new
    create_chirp = Chirper::UseCase::CreateChirp.new(
      chirp_gateway: chirp_gateway
    )
    view_chirp = Chirper::UseCase::ViewChirp.new(
      chirp_gateway: chirp_gateway
    )

    created_chirp_id = create_chirp.execute(
      title: 'Cats are great',
      body: 'All of the cats are the best cats'
    )[:id]

    # view_chirp.execute -> { title: 'a', body: 'b' }
    created_chirp = view_chirp.execute(id: created_chirp_id)

    expect(created_chirp[:title]).to eq('Cats are great')
    expect(created_chirp[:body]).to eq('All of the cats are the best cats')
  end
end
