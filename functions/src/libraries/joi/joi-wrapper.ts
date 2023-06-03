import Joi from 'joi';
import {
  Invitation,
  SendMatchNotificationsBody,
} from '../../controllers/match-invitation-notifications/types/types';

class JoiWrapper {
  validate<T>(
    validationSchema: Joi.ObjectSchema<T>,
    validationObject: any
  ): Joi.ValidationResult<T> {
    const result = validationSchema.validate(validationObject);

    return result;
  }

  sendMatchNotificationsBodySchema: Joi.ObjectSchema<SendMatchNotificationsBody> =
    Joi.object({
      data: Joi.object({
        invitations: Joi.array<Invitation[]>()
          .items(
            Joi.object<Invitation>({
              playerId: Joi.string().required(),
              matchName: Joi.string().required(),
              matchId: Joi.string().required(),
            })
          )
          .required(),
      }).required(),
    });

  // TODO old
  // sendMatchNotificationsBodySchema: Joi.ObjectSchema<SendMatchNotificationsBody> =
  //   Joi.object({
  //     invitations: Joi.array<Invitation[]>()
  //       .items(
  //         Joi.object<Invitation>({
  //           playerId: Joi.string().required(),
  //           matchName: Joi.string().required(),
  //           matchId: Joi.string().required(),
  //         })
  //       )
  //       .required(),
  //   });
}

export const joiWrapper = new JoiWrapper();
