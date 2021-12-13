/*
 * Copyright 2018 ConsenSys AG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */
pragma solidity ^0.4.23;

/**
 * This is a greeting contract which has a voting capability. This allows
 * the greeting value to be returned to be voted on by participants of this
 * contract.
 */
interface VotingGreetingInterface {

    /**
     * Propose that a certain action be voted on.
     *
     * @param _participant The participant which the vote relates to, or 0 for non-participant
     *  related voting.
     * @param _action The action to be voted on.
     * @param _additionalData Value related to the vote: proposed greeting, address of voting algorithm
     */
    function proposeVote(address _participant, uint16 _action, uint256 _additionalData) external;

    /**
     * Vote for a proposal.
     *
     * If an account has already voted, they can not vote again or change their vote.
     *
     * @param _participant The participant which the vote relates to, or 0 for non-participant
     *  related voting.
     * @param _action The action to be voted on.
     * @param _voteFor True if the transaction sender wishes to vote for the action.
     */
    function vote(address _participant, uint16 _action, bool _voteFor) external;

    /**
     * Action a vote.
     *
     * @param _participant The participant which the vote relates to, or 0 for non-participant
     *  related voting.
     */
    function actionVotes(address _participant) external;

    /**
     * Get the greeting.
     *
     * @return The current greeting.
     */
    function getGreeting() external view returns (uint256);

    /**
     * Get the length of time, measured in blocks, during which a vote takes place.
     *
     * @return Length of voting period in blocks.
     */
    function getVotingPeriod() external view returns (uint32);

    /**
     * Get the length of time, measured in blocks, during which who voted and how they voted
     * can be viewed, prior to it being actioned.
     *
     * @return Length of vote viewing period in blocks.
     */
    function getVoteViewingPeriod() external view returns (uint32);

    /**
     * Get the address of the voting algorithm contract.
     *
     * @return Address of voting algorithm contract.
     */
    function getVotingAlgorithm() external view returns (address);

    /**
     * Indicate if a certain account is a participant.
     *
     * @param _participant Account to check to see if it is a participant.
     * @return true if _participant is a participant.
     */
    function isParticipant(address _participant) external view returns(bool);

    /**
     * Get the number of participants.
     *
     * @return number of participants.
     */
    function getNumberParticipants() external view returns(uint32);

    /**
     * Get the active votes.
     *
     * @return items actively being voted on
     */
    function getActiveVotes() external view returns(address[]);

    /**
     * Get the version of the underlying contract.
     *
     * @return Version number.
     */
    function getVersion() external pure returns (uint16);



    event VoteResult(address _participant, uint16 _action, bool _result);



}