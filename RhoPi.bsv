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

import KeccakGlobals::*;

function KState pi(KState in);
	KState out = ?;
	for (Integer y = 0; y < 5; y = y + 1)
		for (Integer x = 0; x < 5; x = x + 1)
			for (Integer i = 0; i < 64; i = i + 1)
				out[(2*x+3*y)%5][0*x+1*y][i] = in[y][x][i];
	return out;
endfunction

function KState rho(KState in);
	Integer rho_disp[5][5] = {
		/*[0][]*/ { 0,  1, 62, 28, 27},
		/*[1][]*/ {36, 44,  6, 55, 20},
		/*[2][]*/ { 3, 10, 43, 25, 39},
		/*[3][]*/ {41, 45, 15, 21,  8},
		/*[4][]*/ {18,  2, 61, 56, 14}
	};

	KState out = ?;
	for (Integer y = 0; y < 5; y = y + 1)
		for (Integer x = 0; x < 5; x = x + 1)
			for(Integer i = 0; i < 64; i = i + 1)
				out[y][x][i] = in[y][x][(64+i-rho_disp[y][x])%64];
	return out;
endfunction

function KState rho_pi(KState in) = pi(rho(in));