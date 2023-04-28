// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract Enum{
    enum gender {male, female}

    gender public _gender =  gender.male;
}