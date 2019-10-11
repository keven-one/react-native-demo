import React, { Component } from 'react';
import { View, Text } from 'react-native';
import ImageViewer from 'react-native-image-zoom-viewer';
import GlobalStyles from '../../utils/GlobalStyles'
const images = [
    {
        url: 'https://facebook.github.io/react-native/img/tiny_logo.png',
    },
    {
        url: 'https://facebook.github.io/react-native/img/tiny_logo.png',
    },
    {
        url: 'https://facebook.github.io/react-native/img/tiny_logo.png',
    },
];

class ImagePickViewer extends Component {
    constructor(props) {
        super(props);
        this.state = {
        };
    }
    _Close() {
        this.props.navigation.goBack();

    }
    render() {
        return (
            <View style={{ flex: 1 }}>
                <ImageViewer
                    imageUrls={images}
                    failImageSource={{
                        url: 'https://avatars2.githubusercontent.com/u/7970947?v=3&s=460',
                        width: GlobalStyles.window_width,
                        height: 85,
                    }}
                    onClick={() => { // 图片单击事件
                        this._Close()
                    }}
                />
            </View>
        );
    }
}

export default ImagePickViewer;
