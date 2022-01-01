import React, { useEffect } from 'react';
import { View, Text, StyleSheet } from 'react-native';

import ProfileImage from '~/src/common/components/ProfileImage';

const DetailScreen = ({ route, navigation }) => {

    useEffect(() => {
        if (name !== null) { navigation.setOptions({ title: name }); }
    });

    const { item: { name, description, imageSource } } = route.params;
    return (
        <View style={styles.verticalCenter}>
            <ProfileImage imageSource={imageSource}/>
            <Text style={styles.nameText}>{name}</Text>
            <Text style={styles.descriptionText}>{description}</Text>
        </View>
    );
};

const styles = StyleSheet.create({
    verticalCenter: {
        flexGrow: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    nameText: {
        fontSize: 20,
        fontWeight: 'bold',
        marginVertical: 8
    },
    descriptionText: {
        fontSize: 18,
    }
});

export default DetailScreen;