# MCQ Quiz App with Provider Documentation

This documentation provides a comprehensive guide on Running, and testing the Multiple Choice Quiz (MCQ) app implemented using Flutter and the Provider package for state management and Following Clean Architeture. This app allows users to take quizzes, answer multiple-choice questions, track their scores, and receive feedback on their answers.

## Table of Contents
1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Running The Project](#running-the-project)
3. [App Overview](#app-overview)
4. [User Interface Design](#user-interface-design)
5. [App Logic and Features](#app-logic-and-features)
6. [State Management with Provider](#state-management-with-provider)
7. [Error Handling](#error-handling)
8. [Testing](#testing)
9. [Documentation](#documentation)
10. [Conclusion](#conclusion)

## 1. Introduction<a name="introduction"></a>

The QuizMaster is a Flutter application that offers users the opportunity to take multiple-choice quizzes. It employs the Provider package for state management, ensuring efficient and organized management of quiz-related data. Users can answer questions, receive immediate feedback, and keep track of their scores.

## 2. Getting Started<a name="getting-started"></a>

### Prerequisites<a name="prerequisites"></a>

To set up and run the QuizMaster, ensure that you have the following prerequisites:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
- A code editor, such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Running The Project<a name="running-the-project"></a>

Follow these steps to run the project:

1.  Navigate to the project directory:
   ```bash
   cd mcq_quiz_app
   
   ```

2. To Run The Project use the following command:
   ```bash
   flutter run
   ```

## 3. App Overview<a name="app-overview"></a>

The QuizMaster allows users to take quizzes that consist of multiple-choice questions. Key features of the app include:

- Displaying questions one at a time.
- Providing multiple answer options for each question.
- Allowing users to select an answer.
- Displaying the user's selected answer.
- Providing immediate feedback on whether the selected answer is correct or incorrect.
- Keeping track of the user's score.
- Moving to the next question after the user selects an answer or after a certain time interval.
- Ending the quiz when all questions have been answered or after a fixed number of questions.

## 4. User Interface Design<a name="user-interface-design"></a>

The user interface of the QuizMaster includes the following components:

- A question display area.
- Multiple answer options.
- A submit button to submit the selected answer.
- Feedback on the correctness of the answer.
- A score tracker.

The design is visually appealing and intuitive to ensure a seamless and engaging user experience.

## 5. App Logic and Features<a name="app-logic-and-features"></a>

The app's logic revolves around the following core features:

- Creating a list of multiple-choice questions with correct answers and answer options.
- Randomly selecting and displaying one question at a time.
- Allowing the user to choose an answer.
- Checking if the selected answer is correct and updating the score accordingly.
- Moving to the next question after the user selects an answer or after a certain time interval.
- Ending the quiz when all questions have been answered or after a fixed number of questions.

## 6. State Management with Provider<a name="state-management-with-provider"></a>

The QuizMaster uses the Provider package for efficient state management. Key aspects of state management include:

- Creating providers for storing the current question, user score, and other relevant information.
- Updating and listening to state changes using the Provider package.
- Organizing and separating the UI and business logic using Provider.

## 7. Error Handling<a name="error-handling"></a>

The app implements robust error handling to ensure a smooth user experience. Error handling includes:

- Properly handling errors that may occur during quiz interactions. by adopting the Functional programming technique using dartz
- Displaying error messages to the user when necessary, providing clear feedback.

## 8. Testing<a name="testing"></a>

The QuizMaster is thoroughly tested to ensure that all quiz functionality works as expected. Testing includes:

- Displaying questions accurately.
- Tracking the user's score correctly.
- Providing feedback for answers.
- Ensuring a seamless user experience.
- Writing Test Case for Fetch Quiz UseCase
    ```bash
        flutter test
    ```


## 9. Documentation<a name="documentation"></a>

This documentation provides detailed instructions on setting up the project, using the Provider package for state management, and running the QuizMaster.test the app effectively.

## 10. Conclusion<a name="conclusion"></a>

The QuizMaster with Provider is a well-structured using clean architecture, Test Driven Development and target efficiency  that demonstrates the capabilities of Flutter and the Provider package for state management. It offers a smooth and engaging user experience for taking multiple-choice quizzes.
