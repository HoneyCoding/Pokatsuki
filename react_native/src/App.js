import React from 'react';
import { StyleSheet } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import * as ScreenName from './constant/ScreenName';
import MainScreen from './screens/Main';
import DetailScreen from './screens/Detail';

const Stack = createNativeStackNavigator();

export default App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name={ScreenName.mainScreenName} options={{ title: '멤버 현황' }}>
          { props => <MainScreen {...props} style={styles.fullScreen}/> }
        </Stack.Screen>
        <Stack.Screen name={ScreenName.detailScreenName} options={{ title: '멤버 정보' }}>
          { props => <DetailScreen {...props} style={styles.fullScreen}/> }
        </Stack.Screen>
      </Stack.Navigator>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  fullScreen: {
    flexGrow: 1
  }
});