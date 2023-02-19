import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Post } from '../../entities/SocialPosts';
import { CreatePostDto } from './dto/create-post.dto';
import { UpdatePostDto } from './dto/update-post.dto';

@Injectable()
export class PostsService {
  constructor(
    @InjectRepository(Post)
    private postsRepository: Repository<Post>,
  ) {}

  async findAll(): Promise<Post[]> {
    return this.postsRepository.find();
  }

  async findOne(id: number): Promise<Post> {
    return this.postsRepository.findOne(id);
  }

  async create(createPostDto: CreatePostDto): Promise<Post> {
    const post = new Post();
    post.userId = createPostDto.userId;
    post.groupId = createPostDto.groupId;
    post.content = createPostDto.content;
    post.mediaUri = createPostDto.mediaUri;
    post.location = createPostDto.location;
    post.totalLike = 0;
    post.totalComment = 0;
    return this.postsRepository.save(post);
  }

  async update(id: number, updatePostDto: UpdatePostDto): Promise<Post> {
    const post = await this.postsRepository.findOne(id);
    post.content = updatePostDto.content;
    post.mediaUri = updatePostDto.mediaUri;
    post.location = updatePostDto.location;
    return this.postsRepository.save(post);
  }

  async remove(id: number): Promise<void> {
    await this.postsRepository.delete(id);
  }
}