#!/usr/bin/env awk -f

BEGIN { S="sse sse2 sse3 ssse3 avx" }

match($0, /flags="-m([^=]*)"/, cflags) {
    if (!index(S, cflags[1])) {
        sub(cflags[1], "THROWN_AWAY")
    }
}

{ print }
