VERSION=$(git tag | tail -1 | cut -d'v' -f 2)
ARCH=amd64
src=$(git rev-parse --show-toplevel)

# Create temporary directories
cp -r clionly_template "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}"
cp -r qtonly_template "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}"
cp -r full_template "$PWD/menabitcoin_full-${VERSION}_${ARCH}"
cp -r blob_template "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu"

# Replace version and architecture
sed -i "s/VERSION/${VERSION}/" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/VERSION/${VERSION}/" "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/VERSION/${VERSION}/" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/DEBIAN/control"

sed -i "s/ARCH/${ARCH}/" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/ARCH/${ARCH}/" "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/ARCH/${ARCH}/" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/DEBIAN/control"

# Copy package contents

## mans

### clionly
cp "$src/doc/man/menabitcoind.1" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/menabitcoind.1"
cp "$src/doc/man/menabitcoin-tx.1" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/menabitcoin-tx.1"
cp "$src/doc/man/menabitcoin-cli.1" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/menabitcoin-cli.1"
cp "$src/doc/man/menabitcoin-wallet.1" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/menabitcoin-wallet.1"

### full
cp "$src/doc/man/menabitcoind.1" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/share/man/man1/menabitcoind.1"
cp "$src/doc/man/menabitcoin-tx.1" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/share/man/man1/menabitcoin-tx.1"
cp "$src/doc/man/menabitcoin-cli.1" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/share/man/man1/menabitcoin-cli.1"
cp "$src/doc/man/menabitcoin-wallet.1" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/share/man/man1/menabitcoin-wallet.1"
cp "$src/doc/man/menabitcoin-qt.1" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/share/man/man1/menabitcoin-qt.1"

### blob
cp "$src/doc/man/menabitcoind.1" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/menabitcoind.1"
cp "$src/doc/man/menabitcoin-tx.1" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/menabitcoin-tx.1"
cp "$src/doc/man/menabitcoin-cli.1" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/menabitcoin-cli.1"
cp "$src/doc/man/menabitcoin-wallet.1" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/menabitcoin-wallet.1"
cp "$src/doc/man/menabitcoin-qt.1" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/menabitcoin-qt.1"

### qtonly

cp "$src/doc/man/menabitcoin-qt.1" "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}/share/man/man1/menabitcoin-qt.1"

## binaries

### clionly
cp "$src/src/menabitcoind" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/bin/menabitcoind"
cp "$src/src/menabitcoin-tx" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/bin/menabitcoin-tx"
cp "$src/src/menabitcoin-cli" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/bin/menabitcoin-cli"
cp "$src/src/menabitcoin-wallet" "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}/bin/menabitcoin-wallet"

### full
cp "$src/src/menabitcoind" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/bin/menabitcoind"
cp "$src/src/menabitcoin-tx" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/bin/menabitcoin-tx"
cp "$src/src/menabitcoin-cli" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/bin/menabitcoin-cli"
cp "$src/src/menabitcoin-wallet" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/bin/menabitcoin-wallet"
cp "$src/src/qt/menabitcoin-qt" "$PWD/menabitcoin_full-${VERSION}_${ARCH}/bin/menabitcoin-qt"

### blob
cp "$src/src/menabitcoind" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/menabitcoind"
cp "$src/src/menabitcoin-tx" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/menabitcoin-tx"
cp "$src/src/menabitcoin-cli" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/menabitcoin-cli"
cp "$src/src/menabitcoin-wallet" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/menabitcoin-wallet"
cp "$src/src/qt/menabitcoin-qt" "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/menabitcoin-qt"


### qtonly
cp "$src/src/qt/menabitcoin-qt" "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}/bin/menabitcoin-qt"

# Build packages
dpkg -b "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}"
dpkg -b "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}"
dpkg -b "$PWD/menabitcoin_full-${VERSION}_${ARCH}"
tar -czf "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu.tar.gz" -C "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu" .

# Remove temporary directories
rm -rf "$PWD/menabitcoin_clionly-${VERSION}_${ARCH}"
rm -rf "$PWD/menabitcoin_qtonly-${VERSION}_${ARCH}"
rm -rf "$PWD/menabitcoin_full-${VERSION}_${ARCH}"
rm -rf "$PWD/menabitcoin-${VERSION}-${ARCH}-linux-gnu"
