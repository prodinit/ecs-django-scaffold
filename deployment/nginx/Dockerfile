FROM public.ecr.aws/nginx/nginx:perl
COPY deployment/nginx/nginx.conf /etc/nginx/conf.d
COPY static /static/
RUN rm -rf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80