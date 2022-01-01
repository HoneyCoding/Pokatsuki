import React from "react";
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native';

import ProfileImage from "~/src/common/components/ProfileImage";
import Images from '~/src/assets/images';
import * as ScreenName from '~/src/constant/ScreenName';

const MainListItem = ({item, navigation}) => {
    const { name, description, imageSource = Images.personIcon } = item;
    return (
    <TouchableOpacity onPress={() => navigation.navigate(ScreenName.detailScreenName, { item })}>
        <View style={styles.itemStyle}>
            <ProfileImage imageSource={imageSource}/>
            <View style={styles.verticalTextGroup}>
                <Text style={styles.nameText}>{name}</Text>
                <Text style={styles.descriptionText}>{description}</Text>
            </View>
        </View>
    </TouchableOpacity>);
};

const styles = StyleSheet.create({
    itemStyle: {
        flexDirection: 'row',
        paddingTop: 8,
        paddingBottom: 8,
        paddingStart: 16,
        paddingEnd: 16,
    },
    verticalTextGroup: {
        flexDirection: 'column',
        flex: 1,
        paddingStart: 16
    },
    nameText: {
        marginBottom: 8,
        fontSize: 20,
        fontWeight: 'bold'
    },
    descriptionText: {
        fontSize: 18
    }
});

export default MainListItem;