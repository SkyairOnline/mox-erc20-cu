#pragma version 0.4.3
"""
@license MIT
@title Snek Token
@author Aldo Surya Ongko
@notice This is my ERC20 in vyper
"""
from ethereum.ercs import IERC20
implements: IERC20

from pcaversaccio.snekmate.src.snekmate.auth import ownable
from pcaversaccio.snekmate.src.snekmate.tokens import erc20

initializes: ownable
initializes: erc20[ownable := ownable]

exports: erc20.__interface__

NAME: constant(String[25]) = "Snek Token"
SYMBOL: constant(String[5]) = "SNEK"
DECIMALS: constant(uint8) = 18
EIP712_VERSION: constant(String[20]) = "1"

@deploy
def __init__(initial_supply: uint256):
    ownable.__init__()
    erc20.__init__(NAME, SYMBOL, DECIMALS, NAME, EIP712_VERSION)
    erc20._mint(msg.sender, initial_supply)
