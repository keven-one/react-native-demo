import React, { Component } from 'react'
import { Text, View, ScrollView, Image, TouchableOpacity, StyleSheet } from 'react-native'

export class Focus extends Component {
    constructor(props) {
        super(props)

        this.state = {

        }
    }

    render() {
        return (
            <View>
                <ScrollView horizontal={true} showsHorizontalScrollIndicator={false} style={styles.scroll}>
                    {
                        this.props.data.map((item, index) => {
                            return (
                                <View style={styles.view}>
                                    <Image style={styles.image} source={{ uri: 'https://facebook.github.io/react-native/img/tiny_logo.png' }}></Image>
                                    <Text style={styles.font1}>名字</Text>
                                    <Text style={styles.font2}>角色</Text>
                                    <TouchableOpacity style={[index % 3 == 0 ? { backgroundColor: '#FFBB06', borderWidth: 0 } : { backgroundColor: 'white', borderWidth: 1 }, styles.button]} >
                                        <Text style={[index % 3 == 0 ? { color: 'white', } : { color: '#999999' }, styles.font]}>{item}</Text>
                                    </TouchableOpacity>
                                </View>
                            )
                        })
                    }
                </ScrollView>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    scroll: {
        height: 190,
    },
    view: {
        height: 180,
        width: 142,
        marginLeft: 15,
        marginBottom: 5,
        marginTop: 5,
        borderWidth: 1,
        borderColor: '#E8E8E8',
        borderRadius: 6,
        borderStyle: 'solid',
        alignItems: 'center',
        justifyContent: 'center'
    },
    image: {
        width: 65,
        height: 65,
        borderRadius: 50,
        marginBottom: 10,

    },
    button: {
        width: 80,
        height: 30,
        borderColor: '#C7C7C7',
        borderRadius: 5,
    },
    font: {
        // flex: 1,
        width: 80,
        height: 30,
        lineHeight: 30,
        textAlign: 'center'
    },
    font1: {
        textAlign: 'center',
        marginBottom: 10,
        fontSize: 18,
        fontWeight: 'bold'
    },
    font2: {
        textAlign: 'center',
        marginBottom: 10,
    }
})

export default Focus
