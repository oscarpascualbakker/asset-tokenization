// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract AssetTokenization {

    address public immutable owner;

    // Token details
    string public constant name = "AssetToken";
    string public constant symbol = "AT";
    uint256 public constant decimals = 6;

    uint256 public totalSupply;

    // Ownership mapping
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // Owner mapping for asset
    mapping(uint256 => address) public assetOwners;


    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event AssetRegistered(uint256 indexed assetId, address indexed owner);


    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }


    /**
     * @dev Constructor function to initialize contract and set the initial supply of tokens.
     * @param _initialSupply Initial amount of tokens to mint.
     */
    constructor(uint256 _initialSupply) {
        owner = msg.sender;
        totalSupply = _initialSupply * 10 ** decimals;
        balanceOf[msg.sender] = totalSupply;
    }


    /**
     * @dev Function to transfer tokens.
     * @param _to The address to transfer tokens to.
     * @param _value The amount of tokens to transfer.
     * @return success Returns true if transfer is successful.
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }


    /**
     * @dev Function to approve a spender.
     * @param _spender The address of the account allowed to spend.
     * @param _value The amount of tokens to approve.
     * @return success Returns true if approval is successful.
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    /**
     * @dev Function to transfer tokens from one address to another.
     * @param _from The address to transfer tokens from.
     * @param _to The address to transfer tokens to.
     * @param _value The amount of tokens to transfer.
     * @return success Returns true if transfer is successful.
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from], "Insufficient balance");
        require(_value <= allowance[_from][msg.sender], "Allowance exceeded");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }


    /**
     * @dev Function to register asset ownership.
     * @param _assetId Unique identifier for the asset.
     * @return success Returns true if registration is successful.
     */
    function registerAsset(uint256 _assetId) public returns (bool success) {
        require(assetOwners[_assetId] == address(0), "Asset already registered");
        assetOwners[_assetId] = msg.sender;
        emit AssetRegistered(_assetId, msg.sender);
        return true;
    }


    /**
     * @dev Function to transfer asset ownership.
     * @param _assetId Unique identifier for the asset.
     * @param _newOwner Address of the new owner of the asset.
     * @return success Returns true if transfer is successful.
     */
    function transferAsset(uint256 _assetId, address _newOwner) public returns (bool success) {
        require(assetOwners[_assetId] == msg.sender, "You are not the owner of this asset");
        assetOwners[_assetId] = _newOwner;
        emit AssetRegistered(_assetId, _newOwner);
        return true;
    }


    /**
     * @dev Function to mint new tokens.
     * @param _amount Amount of new tokens to create.
     */
    function mint(uint256 _amount) public onlyOwner {
        totalSupply += _amount * 10 ** decimals;
        balanceOf[owner] += _amount * 10 ** decimals;
    }

}
