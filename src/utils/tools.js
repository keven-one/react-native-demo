/*
 * @Description: Description
 * @Author: Yongchao Wang
 * @Date: 2019-09-30 09:14:52
 * @LastEditors: Yongchao Wang
 * @LastEditTime: 2019-09-30 09:32:10
 */
import React, {
    Component
} from 'react';
import {
    View,
    Text,
    NativeModules,
    Platform,
    StatusBar
} from 'react-native';

function statusBarHeight() {
    return StatusBar.currentHeight
};


export {
    statusBarHeight
}