import humps from 'humps';
import api from './api';

const path = '/api/v1/courses';

export default {
  getAll(courseId) {
    return api({
      method: 'get',
      url: `${path}/${courseId}/reviews`,
    });
  },
  create(courseId, review) {
    return api({
      method: 'post',
      url: `${path}/${courseId}/reviews`,
      data: {
        ...humps.decamelizeKeys(review),
      },
    });
  },
  delete(courseId, reviewId) {
    return api({
      method: 'delete',
      url: `${path}/${courseId}/reviews/${reviewId}`,
    });
  },
};
