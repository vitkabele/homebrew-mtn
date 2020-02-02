cask 'traderpro' do
  version '11.14.3'
  sha256 '75c6e1acea08a38654bfc6bd4bfc54159815d69f40dee846f2f0ea7aa5f5543e'

  url "https://login.tradergo.cz/download.pro/mac?id=TraderGO&arch=x64&version=#{version}&lang=en-US"
  name 'TraderPro'
  homepage 'https://www.tradergo.cz/cs/obchodni-aplikace/predstaveni-aplikace'

  app 'TraderPRO.app'
end
