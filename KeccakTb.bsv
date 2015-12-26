import Keccak::*;
import StmtFSM::*;

(* synthesize *)
module mkKeccakTb(Empty);
	let keccak <- mkKeccak;

	function disp = action
		let x <- keccak.squeeze;
		$display("%H", x);
	endaction;

	mkAutoFSM(seq
		keccak.init;
		keccak.absorb('h59BE26C913EE0799);
		keccak.absorb('hFC91413D0AD94111);
		keccak.absorb('h0C209972078E495B);
		keccak.absorb('h8044BA6636D3B271);
		keccak.absorb('h42DB88F7783423F0);
		keccak.absorb('hB044B569DF7ED79A);
		keccak.absorb('h1BE54CE435461ED5);
		keccak.absorb('h4BA62AF47660DB2A);
		keccak.absorb('hF8738008516804C6);
		keccak.absorb('h52BD52F3AB3D25FC);
		keccak.absorb('h7BFAFB6E1C80DDC1);
		keccak.absorb('h0821A793701A602E);
		keccak.absorb('h842ED76427B3F302);
		keccak.absorb('hEDA4E042F53C731D);
		keccak.absorb('h34066C764266CF06);
		keccak.absorb('h8000000000088967);
		keccak.go;
		disp;
		disp;
		disp;
		disp;
	endseq);
endmodule