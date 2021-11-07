import humps from 'humps';
import api from './api';

const path = '/api/v1/reviews';

export default {
  getAll(params = {}) {
    return api({
      method: 'get',
      url: path,
      params: humps.decamelizeKeys(params),
    });
  },
  create(courseId, review) {
    return api({
      method: 'post',
      url: path,
      data: {
        ...humps.decamelizeKeys(review),
        ...humps.decamelizeKeys({ courseId }),
      },
    });
  },
  delete(reviewId) {
    return api({
      method: 'delete',
      url: `${path}/${reviewId}`,
    });
  },
};
