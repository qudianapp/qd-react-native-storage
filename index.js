/**
 * RN与Native公用存储
 * ios UserDefaults
 * android SharedPreferences
 * Created by shangyuchen on 2018-07-13
 */
import {
    NativeModules,
    Platform,
} from 'react-native';
const { RNStorage } = NativeModules;
const isAndroid = Platform.OS === 'android';

class XTUserDefaults {
    static setArrayForKey(array, key) {
        if (isAndroid) {
            const value = JSON.stringify(array);
            RNStorage.setStringForKey(value, key);
        } else {
            RNStorage.setArrayForKey(array, key);
        }
    }

    static setStringForKey(string, key) {
        RNStorage.setStringForKey(string, key);
    }

    static setObjectForKey(object, key) {
        if (isAndroid) {
            const value = JSON.stringify(object);
            RNStorage.setStringForKey(value, key);
        } else {
            RNStorage.setObjectForKey(object, key);
        }
    }

    static setLongForKey(long, key) {
        RNStorage.setLongForKey(long, key);
    }

    static setDoubleForKey(double, key) {
        RNStorage.setDoubleForKey(double, key);
    }

    static setBoolForKey(bool, key) {
        RNStorage.setBoolForKey(bool, key);
    }

    static arrayForKey(key) {
        return new Promise((resolve, reject) => {
            if (isAndroid) {
                RNStorage.stringForKey(key)
                    .then((res) => {
                        resolve(JSON.parse(res));
                    })
                    .catch((e) => {
                        reject(e);
                    });
            } else {
                RNStorage.arrayForKey(key)
                    .then((res) => {
                        resolve(res);
                    })
                    .catch((e) => {
                        reject(e);
                    });
            }
        })
    }

    static stringForKey(key) {
        return new Promise((resolve, reject) => {
            RNStorage.stringForKey(key)
                .then((res) => {
                    resolve(res);
                })
                .catch((e) => {
                    reject(e);
                })
        })
    }

    static objectForKey(key) {
        return new Promise((resolve, reject) => {
            if (isAndroid) {
                RNStorage.stringForKey(key)
                    .then((res) => {
                        resolve(JSON.parse(res));
                    })
                    .catch((e) => {
                        reject(e);
                    });
            } else {
                RNStorage.objectForKey(key)
                    .then((res) => {
                        resolve(res);
                    })
                    .catch((e) => {
                        reject(e);
                    });
            }
        })
    }

    static longForKey(key) {
        return new Promise((resolve, reject) => {
            RNStorage.longForKey(key)
                .then((res) => {
                    resolve(res);
                })
                .catch((e) => {
                    reject(e);
                })
        })
    }

    static doubleForKey(key) {
        return new Promise((resolve, reject) => {
            RNStorage.doubleForKey(key)
                .then((res) => {
                    resolve(res);
                })
                .catch((e) => {
                    reject(e);
                })
        })
    }

    static boolForKey(key) {
        return new Promise((resolve, reject) => {
            RNStorage.boolForKey(key)
                .then((res) => {
                    resolve(res);
                })
                .catch((e) => {
                    reject(e);
                })
        })
    }

    static removeItemForKey(key) {
        RNStorage.removeItemForKey(key);
    }
}

export default XTUserDefaults;
