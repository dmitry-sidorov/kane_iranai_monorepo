import { FC, useEffect } from 'react';
import {
  Button,
  PasswordInput,
  Paper,
  Stack,
  TextInput,
  Title,
} from '@mantine/core';
import { useForm } from '@mantine/form';
// import { useNavigate } from 'react-router-dom';

import { RoutePath } from '@/constants';
import { useNotification } from '@/hooks';
// import { TokenService, UserService } from '@/services';
// import { FormValidator } from '@/utils';

const SignInFormField = {
  email: 'email',
  password: 'password',
} as const;

type SignInFormFieldEnum = typeof SignInFormField[keyof typeof SignInFormField];
type SignInFormValues = Record<SignInFormFieldEnum, string>;

const initialFormValues = {
  [SignInFormField.email]: '',
  [SignInFormField.password]: '',
};

export const SignInPage: FC = () => {
  const { addSuccessNotification, addFailureNotification } = useNotification();
  const { errors, post, processing, data, setData } = useForm({
    email: "",
    password: ""
  });


  useEffect(() => {
    console.log('errors: ', errors);
  }, [errors]);

  // const form = useForm<SignInFormValues>({
  //   initialValues: initialFormValues,
  //   validate: {
  //     [SignInFormField.email]: FormValidator.validateEmail,
  //     [SignInFormField.password]: FormValidator.validatePassword,
  //   },
  // });

  const onSubmit = () => {
    post('/users/sign_in');
  };

  /*
  const handleSignInSubmit = async ({ email, password }: SignInFormValues) => {
    try {
      const response = await UserService.signIn({ email, password });

      if (!response?.token) {
        addFailureNotification('Log in failed', 'Invalid email or password.');
        return;
      }

      TokenService.setToken(response.token);
      addSuccessNotification('Log in successful', 'Welcome back.');
      navigate(RoutePath.plan);
    } catch (error) {
      console.error('Log in failed', error);
      addFailureNotification('Log in failed', 'Unable to sign in. Please try again.');
    }
  };
  */

  return (
    <Paper maw={400} mx="auto" mt="xl" p="xl" radius="md" shadow="sm" withBorder>
      <form onSubmit={onSubmit}>
        <Stack gap="md">
          <Title order={2}>Sign in</Title>
          <TextInput
            required
            autoComplete="email"
            label="Email"
            placeholder="you@example.com"
            type="email"
            value={data.email}
            onChange={(e) => setData(SignInFormField.email, e.target.value)}
          />
          <PasswordInput
            required
            autoComplete="current-password"
            label="Password"
            placeholder="Your password"
            value={data.password}
            onChange={(e) => setData(SignInFormField.password, e.target.value)}
          />
          <Button fullWidth type="submit">
            Sign in
          </Button>
        </Stack>
      </form>
    </Paper>
  );
};
