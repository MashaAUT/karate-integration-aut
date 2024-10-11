package com.github.sn;

import com.github.javafaker.Faker;

import java.text.SimpleDateFormat;
import java.util.Locale;

public class DataFactoryKarate {
    private static Faker faker = new Faker(new Locale("en-US"));

    private DataFactoryKarate() {
        throw new IllegalStateException("Cannot new instance RandomUtil class");
    }

    public static String firstName() {
        return faker.name().firstName();
    }

    public static String lastName() {
        return faker.name().lastName();
    }

    public static Boolean bool() {
        return faker.bool().bool();
    }

    public static String date() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(faker.date().birthday());
    }

    public static String stringWithLength(int lengthOfNChars) {
        return faker.lorem().fixedString(lengthOfNChars).trim();
    }

    public static String string() {
        return RandomUtil.stringWithLength(faker.number().numberBetween(1, 10));
    }

    public static Integer number() {
        return faker.number().numberBetween(10, 1000);
    }
}
