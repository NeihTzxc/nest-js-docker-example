import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from "@nestjs/common/decorators";
import { PostsController } from './posts.controller';
import { PostsService } from './posts.service';
import { Post } from '../../entities/SocialPosts';
@Module({
    imports: [TypeOrmModule.forFeature([Post])],
    controllers: [PostsController],
    providers: [PostsService],
  })
export class PostsModule {}
