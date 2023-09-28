// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {console2 as console} from 'forge-std/Test.sol';

interface IChallenge {
    function stackIt() view external returns (uint256);
}


// ******* This is for use by the challenge creator only!     *******
// ******* Players do not need to change anything here. *******
library CREATOR {

    uint8 constant internal _challengeId = 0x22; // IMPORTANT: CREATOR TO UPDATE THIS!

    // IMPORTANT: CREATOR TO UPDATE THIS!
    // This function returns true or false if the solution is correct.
    // Write logic that will check if the provided solution is correct
    function verify(address solution) internal returns (bool) {
        // add logic to verify solution
        uint response = IChallenge(solution).stackIt();
        return response == 0x420;
    }

    // IMPORTANT: CREATOR TO UPDATE THIS!
    // his function should return the number that should reported for gas for the solution.
    // It could be the measurement of a single function call or multiple.
    function gasReport(address solution)  internal returns (uint256 gasUsed) {
        // add logic to report gas cost of the relevant call or calls to the solution
        uint start = gasleft();
        IChallenge(solution).stackIt();
        gasUsed = start - gasleft();
    }

    function challengeId() internal pure returns (uint8) {
        require(_challengeId != 0xff, "IMPORTANT: CREATOR to update challengeId!");
        return _challengeId;
    }
}