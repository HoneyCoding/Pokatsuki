import React from "react";
import { FlatList } from 'react-native';
import MainListItem from '../MainListItem';
import Images from '~/src/assets/images';

const MainList = (props) => {
    const { navigation } = props;
    return <FlatList
                data={repeatedMainDataList}
                renderItem={({ item }) => <MainListItem item={item} navigation={navigation}/>}
                keyExtractor={item => item.key}
                {...props}
                />
};

const mainDataList = [
    {
        name: '윤원상',
        description: `ㅈㅌ형 제발 구원좀 이러다다죽어~`,
        imageSource: Images.wonsangProfileImage
    },
    {   
        name: '김진태', 
        description: `?????????????????????????????\n나 뭔가 했어?!`,
    },
    {   
        name: '문건하', 
        description: `메이플해야됨ㅅㄱ`,
    },
    {   
        name: '박경호', 
        description: `@이후영 라프텔이라는 서비스 들어봤어?`,
        imageSource: Images.gyeonghoProfileImage
    },
    {   
        name: '이후영', 
        description: `그걸 어디서 듣고 온 거야 ㄷ`,
    },
    {   
        name: '누리', 
        description: `ㅎㅇㅂㅂ`,
        imageSource: Images.nuriProfileImage
    }
];

const repeatedMainDataList = Array(5)
                                .fill(mainDataList)
                                .flatMap((v) => v)
                                .map((value, index) => {
                                    let newValue = { ...value };
                                    newValue.key = `${value.name}-${index}`
                                    return newValue;
                                });

export default MainList;