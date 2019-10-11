/*
 * @Description: Description
 * @Author: Yongchao Wang
 * @Date: 2019-10-08 15:41:59
 * @LastEditors: Yongchao Wang
 * @LastEditTime: 2019-10-10 09:33:27
 */
import {
    createIconSetFromIcoMoon
} from 'react-native-vector-icons';
import glyphMap from './iconfont.json';
const iconSet = createIconSetFromIcoMoon(glyphMap, 'Icomoon', 'iconfont.ttf');

export default iconSet;

export const Button = iconSet.Button;
export const TabBarItem = iconSet.TabBarItem;
export const TabBarItemIOS = iconSet.TabBarItemIOS;
export const ToolbarAndroid = iconSet.ToolbarAndroid;
export const getImageSource = iconSet.getImageSource;