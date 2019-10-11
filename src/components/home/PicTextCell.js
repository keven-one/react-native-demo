import React, { Component } from 'react';
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native';
import RNIcon from "../RNIcon";
import GlobalStyles from '../../utils/GlobalStyles'

export default class PicTextCell extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    static navigationOptions = {
        title: 'React Native组件大全',
    };
    render() {
        return (
            <View style={styles.container}>
                <View style={[styles.horView]}>
                    <Image style={styles.image} source={{ uri: 'https://facebook.github.io/react-native/img/tiny_logo.png' }}></Image>
                    <View style={styles.betweenView}>
                        <View style={styles.horView}>
                            <Text>名字</Text>
                            <RNIcon style={styles.leftIcon} name='dengdai' size={15} color='red'></RNIcon>
                            <RNIcon style={styles.leftIcon} name='fensi' size={15} color='red'></RNIcon>
                        </View>
                        <View style={[styles.horView, styles.betweenView, styles.opView]}>
                            <Text style={styles.smallFont}>3分钟前</Text>
                            <View style={[styles.horView, styles.betweenView]}>
                                <RNIcon style={styles.icon} name='shoucang' size={13} color='#999999'></RNIcon>
                                <Text style={styles.smallFont}>1000</Text>
                                <RNIcon style={styles.icon} name='zan' size={13} color='#999999'></RNIcon>
                                <Text style={styles.smallFont}>2000</Text>
                                <RNIcon style={styles.icon} name='pinglun1' size={13} color='#999999'></RNIcon>
                                <Text style={styles.smallFont}>3000</Text>
                            </View>
                        </View>
                    </View>
                </View>
                <Text style={styles.content}>置换是photoshop里面非常容易忽视的一个滤镜。它作用是根据一张置换图颜色通道的不同色值从而将像素点移动不同的距离。</Text>
                <View style={[styles.horView, styles.betweenView, styles.picView]}>
                    {
                        this.props.imageurls.map((item, index) => {
                            return (
                                <TouchableOpacity onPress={this.press.bind(this, index)}>
                                    <Image style={styles.pic} source={{ uri: 'https://facebook.github.io/react-native/img/tiny_logo.png' }} ></Image>
                                </TouchableOpacity>
                            )
                        })
                    }
                </View>
            </View>
        );
    }
    press = (index) => {
        this.props.showPic(index)
    }
}



const styles = StyleSheet.create({
    image: {
        width: 36,
        height: 36,
        marginLeft: 13,
        marginRight: 13,
        borderRadius: 18,
    },
    horView: {
        flexDirection: 'row',
    },
    betweenView: {
        justifyContent: 'space-between',
    },
    centerView: {
        justifyContent: 'center',
    },
    opView: {
        width: GlobalStyles.window_width - 80,
        marginRight: 20,
    },
    icon: {
        marginLeft: 5,
        marginRight: 5
    },
    leftIcon: {
        marginLeft: 3,
    },
    smallFont: {
        fontSize: 12,
        lineHeight: 16,
        color: '#999999'
    },
    content: {
        margin: 13,
        marginTop: 8,
        fontSize: 15,
        color: '#666666',
        letterSpacing: 0.5
    },
    pic: {
        width: (GlobalStyles.window_width - 26 - 20) / 3,
        height: 85,
        borderRadius: 5
    },
    picView: {
        marginLeft: 13,
        marginRight: 13,
        marginBottom: 10
    },
    container: {
        marginTop: 15,
        borderBottomWidth: 0.8,
        borderBottomColor: '#C7C7C7'
    }

})
