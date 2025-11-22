// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;


contract FindByHalf {

    // 二分查找 (Binary Search)
    // 题目描述：在一个有序数组中查找目标值。

    function getByHalf(uint16[] memory params , uint16 value)public pure returns (uint16) {
        return getByHalfTow(getOrder(params),value);
    }

    function getByHalfTow(uint16[] memory params , uint16 value)private pure returns (uint16) {
        uint256 len = params.length;
        if(len==1){
            return params[0];
        }
        uint256 index ;
        uint16 process ;
        if (len % 2==1){
            index = len / 2;
        }else {
            index = (len / 2)-1;
        }
        process = params[index];
        if(value == process){
            return process;
        }else if(value>process){
            return getByHalfTow(getMoveArray(params,index+1,len-1), value);
        }else {
            return getByHalfTow(getMoveArray(params,0,index-1), value);
        }
    }

    function getMoveArray(uint16[] memory params,uint256 indexStart, uint256 indexEnd) private pure returns (uint16[] memory) {
        uint16[] memory result =new uint16[](indexEnd-indexStart+1);
        uint256 j =0;
        for(uint256 i=indexStart;i<=indexEnd;i++){
            result[j] = params[i];
            j++;
        }
        return result;
    }

    function getOrder(uint16[] memory params1)private pure returns (uint16[] memory) {
        uint256 len = params1.length;
        if(len==1){
            return params1;
        }
        if (params1[0] > params1[len-1]){
            uint16[] memory result = new uint16[](len);
            for(uint16 i=0;i<len;i++){
                result[i] = params1[len-1-i];
            }
            return result;
        }else {
            return params1;
        }
    }
    
}
