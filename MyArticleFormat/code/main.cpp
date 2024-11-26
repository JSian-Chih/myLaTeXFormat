#include <Arduino.h>
#include <MPU9250.h>
#include <BMP280_DEV.h>

#define PIN_BUTTON 6
#define PIN_LED 5

#define PIN_SERVO_RX 4
#define PIN_SERVO_RY 3

#define PWM_FREQUENCY 50.0
#define PWM_RESOLUTION 15
#define PWM_MAX_VALUE pow(2,PWM_RESOLUTION) - 1
#define PWM_1MS round(1000.0 / (1000000.0 / PWM_FREQUENCY) * PWM_MAX_VALUE)
#define PWM_MIN round(0.7 * PWM_1MS)
#define PWM_MID round(1.5 * PWM_1MS)
#define PWM_MAX round(2.3 * PWM_1MS)



int jump_flag = 0;
double pre_mag[3];

// Debounce variables
unsigned long lastDebounceTime = 0;
unsigned long debounceDelay = 100;

void button_triger();


// Project Begin
void setup()
{
    // Serial.begin(38400);
    Serial.begin(115200);
    pinMode(PIN_BUTTON,INPUT);
    attachInterrupt(PIN_BUTTON,button_triger,RISING);
    pinMode(PIN_LED,OUTPUT);
    digitalWrite(PIN_LED,0);

    pinMode(PIN_SERVO_RX, OUTPUT);
    pinMode(PIN_SERVO_RY, OUTPUT);
    analogWriteResolution(PWM_RESOLUTION);
    analogWriteFrequency(PIN_SERVO_RX, PWM_FREQUENCY);
    analogWriteFrequency(PIN_SERVO_RY, PWM_FREQUENCY);

    // analogWrite(PIN_SERVO_RX, PWM_MAX);
    // analogWrite(PIN_SERVO_RY, PWM_MAX);
}

void loop() 
{
    // put your main code here, to run repeatedly:
    float sensorVoltage; 
    float sensorValue;
    
    sensorValue = analogRead(A1);
    sensorVoltage = sensorValue/1024*3.3;
    Serial.print(sensorValue);
    Serial.print(" ");
    Serial.print(sensorVoltage,6);
    Serial.println(" ");
    delay(10);
}

// put function definitions here:
void button_triger() {
    // Read the state of the button
    int buttonState = digitalRead(PIN_BUTTON);

    // Check if the button state has changed
    if (buttonState == HIGH) {
        // Check if it's been long enough since the last button press to consider it a valid press
        if ((millis() - lastDebounceTime) > debounceDelay) {
            // Toggle the LED state
            digitalWrite(PIN_LED, !digitalRead(PIN_LED));
        }
        // Update the last debounced time
        lastDebounceTime = millis();
    }
}