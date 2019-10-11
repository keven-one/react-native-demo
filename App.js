/*
 * @Description: Description
 * @Author: Yongchao Wang
 * @Date: 2019-10-10 11:38:33
 * @LastEditors: Yongchao Wang
 * @LastEditTime: 2019-10-11 14:43:58
 */
import React, {
    Component
} from 'react';
import {
    createAppContainer
} from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

import Home from './src/Home';
import ImagePickViewer from './src/components/imageViewer/ImagePickViewer'
const RootStack = createStackNavigator({
    Home: {
        screen: Home,
        navigationOptions: ({ navigation }) => ({
            title: '123',

        }),
    },
    ImagePickViewer: { screen: ImagePickViewer },
},
    {
        initialRouteName: 'Home',
        headerMode: 'none'

    },
);

const AppContainer = createAppContainer(RootStack)
export default class App extends React.Component {
    render() {
        return <AppContainer />;
    }
}
