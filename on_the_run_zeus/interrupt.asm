                ORG     $AD00

IntPage         EQU     HIGH    $

                DEFS    $0101,IntPage+1

                ORG     (IntPage+1)*$0100+(IntPage+1)
                JP      IntRt

