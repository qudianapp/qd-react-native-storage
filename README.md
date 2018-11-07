# qd-react-native-storage

## Getting started

`$ npm install @qudian_mobile/qd-react-native-storage --save`

### Mostly automatic installation

`$ react-native link @qudian_mobile/qd-react-native-storage`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `@qudian_mobile/qd-react-native-storage` and add `RNStorage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNStorage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.qudian.react_storage.RNStoragePackage;` to the imports at the top of the file
  - Add `new RNStoragePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':qd-react-native-storage'
  	project(':qd-react-native-storage').projectDir = new File(rootProject.projectDir, 	'../node_modules/@qudian_mobile/qd-react-native-storage/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':qd-react-native-storage')
  	```


## Usage
```javascript
import RNStorage from 'qd-react-native-storage';

// TODO: What to do with the module?
RNStorage;
```
  
