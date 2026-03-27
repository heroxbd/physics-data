(prev==$0) {
    count++
}

(prev!=$0) {
    print count,prev
    count=1
}

END { print count,prev }

{ prev=$0 }
