mkdir -p $HOME/adcoin_regtest/1
mkdir -p $HOME/adcoin_regtest/2

src/qt/litecoin-qt -regtest -datadir=$HOME/adcoin_regtest/1 -rpcuser=test -rpcpassword=test -rest -port=3339 -rpcport=4443 -server -addnode=localhost:3338 &
src/qt/litecoin-qt -regtest -datadir=$HOME/adcoin_regtest/2 -rpcuser=test -rpcpassword=test -rest -port=3338 -rpcport=4442 -server -addnode=localhost:3339 &

echo "Run `src/litecoin-cli -rpcport=4443 -rpcuser=test -rpcpassword=test <command>` for any commands"
