/* The Keccak sponge function, translated from the designer's
 * VHDL code to BSV by Paulo Matias.
 *
 * Please refer to http://keccak.noekeon.org/
 * for information about Keccak.
 *
 * To the extent possible under law, the implementer has waived
 * all copyright and related or neighboring rights to the source
 * code in this file.
 * http://creativecommons.org/publicdomain/zero/1.0/
 */

import Vector::*;

// parameters

typedef  5 NumPlane;
typedef  5 NumSheet;
typedef 64 N;
typedef 32 NumSlices;
typedef 24 NumRound;

// derived types

typedef TLog#(NumSlices) BitsNumSlices;
typedef TDiv#(N, NumSlices) BitPerSubLane;

typedef Bit#(N) KLane;
typedef Bit#(NumSheet) KRow;
typedef Vector#(NumPlane,KRow) KSlice;
typedef Bit#(BitPerSubLane) SubLane;
typedef Vector#(NumSheet,SubLane) SubPlane;
typedef Vector#(NumPlane,SubPlane) SubState;
typedef Vector#(NumSheet,KLane) KPlane;
typedef Vector#(NumPlane,KPlane) KState;

// types converted to values

Integer n = valueOf(N);
Integer numSlices = valueOf(NumSlices);
Integer numRound = valueOf(NumRound);
Integer bitPerSubLane = valueOf(BitPerSubLane);
Integer np = valueOf(NumPlane);
Integer ns = valueOf(NumSheet);