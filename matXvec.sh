#!/bin/bash
#------------------------------------>8======================================
#  Copyright (c) 2012, pplab (shenyu828@gmail.com)
#  All rights reserved.
#  
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of the <organization> nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#  
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL pplab BE LIABLE FOR ANY
#  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#====================================8<----------------------------------------
# calculate a matrix product a vector
usage() {
    echo " calculate a matrix product a vector "
    echo " usage: matXvec matrix vector "
}

DIE() {
    echo $1
    exit 1
}

while getopts "h" Options
do
    case ${Options} in
        h ) usage; exit ;;
        * ) echo "Unimplemented option chosen.";uasge;exit;;
    esac
done

[ -e $1 ] || DIE "NONEXIST INPUT FILE"
[ -e $2 ] || DIE "NONEXIST INPUT FILE"

dimA=$(head -n1 $1|wc -w)
dimB=$(cat $2|wc -l)
[ $dimA -ne $dimB ] && DIE "The dimensions of matrix and vector are not same"

(cat $2; cat $1)|awk -v lB=$(cat $2|wc -l) '
    NR<=lB {
        B[NR-lA]=$1;
        next;
    } 
    NR>lB {
        s=0;
        for(i=1;i<=NF;++i) s+=$i*B[i]; 
        print s;
    } '

