KnavUtil.print_with_padding 'Constants'

# number constants
[
    # Pi
    {
        value: 3.1415926535897932384626433832795,
        symbol: '&pi;',
        name: 'pi'
    },
    # Euler's number
    {
        value: 2.7182818284590452353602874713527,
        symbol: 'e',
        name: "Euler's number",
    },
    # golden ratio
    {
        value: 1.61803398875,
        symbol: '&phi;',
        name: 'golden ratio',
    },
].each do |hash|
  c = Constant.where(hash).first_or_create
  puts c.inspect
end