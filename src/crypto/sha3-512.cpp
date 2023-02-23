// Copyright (c) 2014-2019 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <crypto/sha3-512.h>

#include <crypto/common.h>

#include <string.h>


////// SHA2-512

CSHA3_512::CSHA3_512()
{
    sha3_512_Init(&ctx);
    bytes = 0;
}

CSHA3_512& CSHA3_512::Write(const unsigned char* data, size_t len)
{
    sha3_Update(&ctx, data, len);
    bytes += len;
    return *this;
}

void CSHA3_512::Finalize(unsigned char hash[SHA3_512_DIGEST_LENGTH])
{
    sha3_Final(&ctx, &hash[0]);
}

CSHA3_512& CSHA3_512::Reset()
{
    sha3_512_Init(&ctx);
    bytes = 0;
    return *this;
}
