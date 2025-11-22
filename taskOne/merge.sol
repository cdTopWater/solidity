// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;


contract Merge {

    //合并两个有序数组 (Merge Sorted Array)
    //题目描述：将两个有序数组合并为一个有序数组

    function mergeArray(uint16[] memory params1,uint16[] memory params2)public pure returns (uint16[] memory) {
        if (params1.length == 0){
            return params2;
        }
        if (params2.length == 0){
            return params1;
        }
        uint16[] memory result1 = getOrder(params1);
        uint16[] memory result2 = getOrder(params2);
        //
        uint256 len = params1.length + params2.length;
        uint16[] memory merged = new uint16[](len);
        uint16 i=0;
        uint16 j=0;
        while(i+j<len){
            if(i>=params1.length){
                merged[i+j] = result2[j];
                j++;
                continue ;
            }
            if(j>=params2.length){
                merged[i+j] = result1[i];
                i++;
                continue ;
            }
            if(result1[i]<result2[j]){
                merged[i+j] = result1[i];
                i++;
            }else {
                merged[i+j] = result2[j];
                j++;
            }
        }
        return merged;
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
