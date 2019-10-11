import React, { Component } from 'react'
import { Text, View, StatusBar, NativeModules, Platform } from 'react-native'

const { StatusBarManager } = NativeModules
export class StatusView extends Component {
    constructor(props) {
        super(props);
        this.state = {
            barHeight: StatusBar.currentHeight
        }


    }
    componentDidMount() {
        if (Platform.OS === 'ios') {
            StatusBarManager.getHeight((statusBarHeight) => {
                this.setState({
                    barHeight: statusBarHeight.height
                })
            })
        }
    }
    render() {
        return (
            <View style={{ height: this.state.barHeight }}>

            </View>
        )
    }
}

export default StatusView
