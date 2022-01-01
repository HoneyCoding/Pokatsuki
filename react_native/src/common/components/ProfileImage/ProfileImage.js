import React from 'react';
import { View, Image, StyleSheet } from 'react-native';

import Images from '~/src/assets/images';

const ProfileImage = (props) => {
    const { imageSource = Images.personIcon } = props;
    const isDefaultImage = imageSource === Images.personIcon;
    return (
    <View
    style={[
        styles.profileImageWrapper, 
        isDefaultImage ? styles.defaultImageWrapper : null]}
    {...props}>
        <Image 
        style={[
            styles.profileImage,
            isDefaultImage ? styles.defaultImage : null
        ]}
        source={imageSource}
        cache={''}/>
    </View>);
};

const styles = StyleSheet.create({
    profileImageWrapper: {
        backgroundColor: '#03A9F4',
        width: 64,
        height: 64,
        borderRadius: 32,
        overflow: "hidden"
    },
    profileImage: {
        width: "100%",
        height: "100%",
    },
    defaultImageWrapper: {
        padding: 8
    },
    defaultImage: {
        tintColor: "#000000",
        opacity: 0.6
    }
});

export default ProfileImage;