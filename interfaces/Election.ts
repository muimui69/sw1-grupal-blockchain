import { BigNumberish } from "ethers";

export interface Candidate {
    candidate_name: string;
    candidate_description: string;
    imgHash: string;
    voteCount: BigNumberish;
    email: string;
}
